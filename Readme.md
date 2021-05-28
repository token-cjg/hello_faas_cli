### Script to setup faas_cli_flask


### Getting started

`curl -O -L https://raw.githubusercontent.com/token-cjg/hello_faas_cli/master/bootstrap.sh && chmod +x bootstrap.sh && bash bootstrap.sh`

Navigate to your VM ip address.

Done!

### Pre-requisites to testing things

1. A faasd host.
1. A function build server.
1. faas-cli installed on your function build server.
1. A docker-hub account.

### Creating a function (the example fixture)

1. scp this to your chosen machine to build things.
2. Install faas-cli.
3. Install the faas-cli templates for python
`faas-cli template store pull python3-flask`
`faas-cli template store pull python3`
4. Log in to your faasd instance using faas-cli.
`faas-cli login -g YOURFAASDHOSTURL -p YOURFAASDHOSTPASSWORD`
5. Alter catapi.yml to point to your dockerhub account.
6. Run the following.
```
cd fixtures
docker login
faas-cli build -f catapi.yml
faas-cli push -f catapi.yml
faas-cli deploy -f catapi.yml
```
7. Invoke the function
`export OPENFAAS_URL=YOURFAASDHOSTURL && echo | faas-cli invoke catapi`

### Building catapi.yml

If you have a dockerhub account of your very own, and have an app id that you wish to apply, run

```
pushd fixtures
jsonnet --ext-str dockerAccount='moohickey' --ext-str app_id='123' catapi.jsonnet > catapi.yml
popd
```

in order to get your catapi.yaml
