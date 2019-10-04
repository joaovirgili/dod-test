# Teste prático realizado para Dodvision

João é dono de uma academia, ele está procurando a solucão de um problema recorrente no seu estabelecimento. O problema acontece na avaliação dos seus clientes, pois nesse momento o indivíduo passa por métricas para definir a quantidade de calorias diárias que é necessário para se obter uma boa forma. Na academia os alimentos são divididos em 3 grupos, Grupo A, Grupo B e Grupo C. Com isso, cada grupo contém uma quantidade n de alimentos.

Nesse universo, uma pessoa precisa comer um alimento de cada grupo para manter a sua dieta de calorias.

Então o João precisa de um sistema aonde ele insere a quantidade de calorias e consegue consultar todas as possíveis combinações de 3 alimentos de grupos diferentes que somados vão atingir a meta calórica.

# Ferramentas e Packages utilizados

- [SLIDY](https://github.com/Flutterando/slidy)
- [DIO](https://pub.dev/packages/dio)
- [Trotter](https://pub.dev/packages/trotter)
- [Bloc Pattern](https://pub.dev/packages/bloc_pattern)

# Extras

Estava na dúvida se era para apenas exibir as combinações cuja soma de calorias fosse igual a meta ou as maiores também. 

Optei por mostrar todas que sejam maiores ou iguais a meta.

Para melhorar a experiencia do usuário, classifiquei as combinações em 3 tipos:
- Verde (soma igual a meta)
- Amarelo (soma até 20% maior que a meta)
- Vermelho (soma mais que 20% maior que a meta)

Isso foi feito pensando que o usuário final gostaria de optar pela combinação mais próxiam da sua meta calórica, melhorando a organização com a etiquetagem.


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
