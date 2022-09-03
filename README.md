# Getting Started with Docker CalcReact App!  
This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).  

--- 

## Para rodar a aplicação do React em container do Docker  

- Entrar no diretório onde o projeto será armazenado (pasta C, Documentos ou outra de sua escolha) e executar essa linha de comando:  

```
npx create-react-app nome-do-react-app
```  

- Entrar na pasta do projeto criado:  

```
cd nome-do-react-app
```  

- Acrescentar um arquivo com nome **Dockerfile** na raiz do projeto (não pode ter nenhuma extensão, como .txt, .doc etc).

- Dentro do **Dockerfile** copiar este script:  

```
# Imagem de Origem (verificar nº da versão atualizada do Node e do react-script!)
FROM node:16-alpine

# Diretório de trabalho (local em que a aplicação fica dentro do container)
WORKDIR /app

# Adiciona `/app/node_modules/.bin` para o $PATH
ENV PATH /app/node_modules/.bin:$PATH

# Instala dependências da aplicação e armazena em cache
COPY package.json /app/package.json
RUN npm install --silent
RUN npm install react-scripts@5.0.1 -g --silent

# Inicializa a aplicação
CMD ["npm", "start"]
```  

###### *OBSERVAÇÃO: É opcional usAR ```--silent``` para silenciar a saída da instalação dos pacotes NPM, pois pode ocultar problemas no funcionamento desses pacotes.*   

- Criar um arquivo com nome **.dockerignore** na pasta do projeto e, dentro dele, incluir:  

```node_modules/```
###### *OBSERVAÇÃO: Deste modo, o diretório de modulos do Node não é enviado para a Deamon do Docker, o que diminui o tempo de construção da imagem.*

- Construir a imagem para o Docker com acréscimo de uma tag (-t):
```
docker build -t sample:dev .
```

- Depois de construída a imagem, é preciso criar o container a partir dela com este comando (para uso no Windows, substituir o caminho e retirar as aspas):
```
docker run -v "C:/caminho/da/pasta/do/projeto/no/seu/computador":/app -v /app/node_modules -p 3001:3000 --rm sample:dev
```
- Se se execução for bem sucedida, será seguida por mensagem com o seguinte conteúdo:
```
> docker-nome-do-react-app@0.1.0 start /app
> react-scripts start

ℹ ｢wds｣: Project is running at http://127.12.0.2/
ℹ ｢wds｣: webpack output is served from /
ℹ ｢wds｣: Content not from webpack is served from /app/public
ℹ ｢wds｣: 404s will fallback to /index.html
Starting the development server…

Compiled successfully!

You can now view dockerized-react-app in the browser.

Local: http://localhost:3000/
On Your Network: http://127.12.0.2:3000/

Note that the development build is not optimized.
To create a production build, use yarn build.
```

###### *OBSERVAÇÃO: O endereço de IP "http://127.12.0.2:3000" é fictício, em ambiente real representa o endereço interno que o Docker atribui ao container.*

- O parâmetro ```-p``` exporta a porta 3001 para a máquina local, que pode ser acessada pelo navegador ao digitar:
```
localhost:3001
```

- Por fim, deste modo, é possível visualizar a página inicial da aplicação React que, aqui neste caso, é uma calculadora:  

<p align="center"> 
<img src="https://github.com/rosacarla/docker-calcreact-app/blob/master/images/localhost-3001-calc.png" width="880">
</p>  

---  

## Autora  
Carla Edila Silveira  
Contato: rosa.carla@pucpr.edu.br  

---  

