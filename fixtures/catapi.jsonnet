{
  version: 1.0,
  provider: {
    name: "openfaas",
    gateway: "http://127.0.0.1:8080"
  },
  functions: {
    std.extVar('app_id') + 'catapi': {
      lang: "python3-flask",
      handler: "./catapi",
      image: std.extVar('dockerAccount') + '/' + std.extVar('app_id') + 'catapi:latest'
    }
  }
}
