Npm.depends({
  "kraken-api": "0.1.3"
});


Package.on_use(function (api) {
  api.add_files('kraken.js', ['server', 'client', 'models']);
});
