bool userIsValid(String user) {
  return (user.length > 5);
}

bool passwordIsValid(String senha) {
  return (senha.length < 6);
}
