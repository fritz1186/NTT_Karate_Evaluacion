function fn() {
  var env = karate.env;
  var baseURLPetStore=''

  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }

  var config = {
    env: env,
    myVarName: 'someValue'
  }

  if (env == 'dev') {
    baseURLPetStore ='https://petstore.swagger.io'

  } else if (env == 'e2e') {
    //aqui iria la url para otro ambiente pero no existe se llena solo como ejemplo
    baseURLPetStore ='https://petstore.swagger.Cert'
  }

  return config={env: env, baseURLPetStore : baseURLPetStore};
}