Add-Type -AssemblyName System.Web

$listener = [System.Net.HttpListener]::new()
$listener.Prefixes.Add("http://localhost:8080/")
$listener.Start()

$root = "c:\Coding\CKM Test"

while ($listener.IsListening) {
  try {
    $context = $listener.GetContext()
    $reqPath = [System.Web.HttpUtility]::UrlDecode($context.Request.Url.AbsolutePath.TrimStart("/"))

    if ([string]::IsNullOrWhiteSpace($reqPath)) {
      $reqPath = "index.html"
    }

    $filePath = Join-Path $root $reqPath

    if (-not (Test-Path $filePath) -and [string]::IsNullOrWhiteSpace([IO.Path]::GetExtension($filePath))) {
      $htmlCandidate = "$filePath.html"
      if (Test-Path $htmlCandidate) {
        $filePath = $htmlCandidate
      }
    }

    if ((Test-Path $filePath) -and -not (Get-Item $filePath).PSIsContainer) {
      $ext = [IO.Path]::GetExtension($filePath).ToLowerInvariant()
      $contentType = switch ($ext) {
        ".html" { "text/html; charset=utf-8" }
        ".css" { "text/css; charset=utf-8" }
        ".js" { "application/javascript; charset=utf-8" }
        ".json" { "application/json; charset=utf-8" }
        ".md" { "text/markdown; charset=utf-8" }
        ".svg" { "image/svg+xml" }
        default { "application/octet-stream" }
      }

      $bytes = [IO.File]::ReadAllBytes($filePath)
      $context.Response.ContentType = $contentType
      $context.Response.Headers["Content-Type"] = $contentType
      $context.Response.ContentLength64 = $bytes.Length
      $context.Response.OutputStream.Write($bytes, 0, $bytes.Length)
    } else {
      $context.Response.StatusCode = 404
      $bytes = [Text.Encoding]::UTF8.GetBytes("Not found")
      $context.Response.OutputStream.Write($bytes, 0, $bytes.Length)
    }

    $context.Response.OutputStream.Close()
  } catch {
  }
}
