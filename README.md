# backend-code-challenge
Ruby/Elixir Code Challenge for Software Engineer applicants

### Setup

Execute o bundle install

`bundle install`

Crie um arquivo na raiz do projeto chamado .env contendo as informacoes abaixo

DATABASE_HOST
DATABASE_NAME
DATABASE_USER
DATABASE_PASSWORD

Faça a criacao do banco e rode as Migrations

`rake db:create`
`db:migrate`

Para rodar a aplicacao é preciso apenas executar puma na raiz do projeto

`puma`

### Testes

Para executar a cobertura de testes rodamos o rspec na raiz do projeto

`rspec`



