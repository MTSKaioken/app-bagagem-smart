# bagagem_smart

projeto para o trabalho de conclusão de curso

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


Como rodar o projeto:

- para rodar em um emulador integrado a IDE
```bash
flutter run --dart-define=email-gmail-remetente='teste@teste.com' --dart-define=password-gmail-remetente='password'
```

- para buildar o APK com as variaveis setadas
```bash
flutter build apk --dart-define=email-gmail-remetente='teste@teste.com' --dart-define=password-gmail-remetente='password'
```

## todo

[ ] - bug onClick na balança

[ ] - melhorar parte relacionada ao status de conexão do dispositivo

[ ] - buscar coordenadas associadas ao usuario no banco

[ ] - buscar nome do lugar com base nas coordenadas associadas ao usuario 

[ ] - redefinição de senha

[ ] - redefinição de senha a partir do menu lateral da dashboard

[ ] - tela de configurações, ajustar um timer (job) para atualização da localização e do peso.

[ ] - loading durante renderizações

[ ] - tempo para expirar o código de redefinição de senha.

[ ] - ao logar, modal perguntando se deseja salvar usuario e/ou senha no local storage. (junto a checkbox de não perguntar novamente)


##  feito

[x] - cadastro de usuario

[x] - login em conta cadastrada

[x] - buscar pesagem associada ao usuario no banco

[x] - reproduzir layout da balança conforme recebido

[x] - termos e condições + politica de privacidade (lorem ipsum)

[x] - salvar foto do usuario

[x] - exibir foto associada ao usuario no menu lateral

## utils

[ ] - aprender a usar o flutter_map para poder exibir a localização da bagagem
referencia: https://www.youtube.com/watch?v=YuwhlhaM1eM

[ ] - responsivo
referencia: https://pub.dev/packages/responsive_builder

[ ] - validador email no cadastro e login
referencia: https://pub.dev/packages/email_validator

[ ] - dados do usuario criptografados:
referencia: https://pub.dev/packages/crypto

[ ] - obj to json
referencia: https://pub.dev/packages/json_serializable
