function (){
env = karate.env; // get system property 'karate.env'
//karate.log('karate.env system property was:', env);
karate.log('\n---------------------Logs for the scenario: ', karate.info.scenarioName, '---------------------');

if (!env) {
    env = 'local'; // local will be default environment
}
var config = { // base config JSON
    env: env
};

if (env == 'local') {
    config.baseUrl = 'http://localhost:3100/api';
}else if (env == 'dev') {
    config.baseUrl = 'http://localhost:3100/api';//update with correct url
}else if (env == 'qa') {
    config.baseUrl = 'http://localhost:3100/api';//update with correct url
}else if (env == 'uat') {
    config.baseUrl = 'http://localhost:3100/api';//update with correct url
}

return config;
}