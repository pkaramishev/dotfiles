oh-my-posh init pwsh --config "$env:USERPROFILE/.config/oh-my-posh/theme.omp.json" | Invoke-Expression
$env:DOCKER_HOST = "npipe:////./pipe/podman-machine-default"
