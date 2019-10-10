# backend-code-challenge
Ruby/Elixir Code Challenge for Software Engineer applicants

### Solucao Escolhida

Decidi usar apenas uma lib ao invez de um framework pois devido a pequena quantidade de features do projeto, apenas uma lib seria mais leve focando apenas na solucao do problema.

Para o calculo da melhor rota é utilizado o algoritmo de Dijkstra, podendo assim haver uma quantidade grande de pontos ligando a origem e o destino que podemos garantir que o valor cobrado pelo frete sempre será referente ao caminha mais curto

### Setup

Execute o bundle install

`bundle install`

Execute o comando abaixo para fazer uma copia do arquivo database.yml

`cp config/database.yml.example config/database.yml `

Altere os dados abaixo no arquivo database.yml, colocando os dados referentes ao seu ambiente

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

s
