# user_crud_example

Um projeto baseado no projeto do FingerprintAPS (https://github.com/matheusEduardoTavares/fingerprint_aps), mas construído de forma mais simples e didática, sendo apenas um MVC com repository para fazer um CRUD de usuários, persistindo os dados localmente no Shared Preferences. Para facilitar, este projeto fará uso do gerenciador de estado default e mais conhecido do Flutter, que é o setState. O foco deste projeto não é a qualidade em si do mesmo, e sim de mostrar como fazer algumas telas e um CRUD básico com Flutter, portanto, a componentização dos Widgets e as técnicas abordadas no mesmo serão básicas.

Alguns desafios interessantes para serem realizados nesse projeto afim de expandir os conhecimentos em Dart / Flutter, fazendo uso de toda a estrutura já disponibilizada neste repositório:
1. Adicionar a feature de fazer logout e login na aplicação (criando um componente na homePage para fazer o logout, e criando a página de login inteira para poder fazer o login, trabalhando com os dados e a parte de autenticação (auth) implementada através do SharedPreferences);
2. Adicionar um ícone à aplicação fazendo uso da lib flutter_launcher_icons (https://pub.dev/packages/flutter_launcher_icons);
3. Separar melhor as responsabilidades da view e da controller no módulo do Home.

## 🔧 Instalação e execução

Para você poder instalar e executar esta aplicação, será preciso ter instalado o git para clonar este repositório e ter a SDK do Flutter instalada na máquina para poder executar o projeto, de preferência na mesma versão usada por mim, que é a 2.10.5. Com isso, basta executar *flutter clean*, e, depois, *flutter pub get* para baixar todas libs em suas respectivas versões do projeto.
<br />
Só com isso já é possível buildar o APP.

<h5 align="center">
  &copy;2022 - <a href="https://github.com/matheusEduardoTavares">Matheus Eduardo Tavares</a>
</h5>