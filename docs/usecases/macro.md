# Macro

### Autenticação
  - O Usuário pode criar uma conta gerênciada pelo aplicativo através de uma tela de cadastro.
  - O Usuário pode logar no aplicativo utilizando uma conta gerênciada ou uma conta Google/Apple.
    - Se o usuário utilizar uma conta Google/Apple ele deverá "completar" o cadastro quando logar no aplicativo.

### Onboarding
  - O Usuário após o login deve se deparar com uma tela de onboarding explicando as funcionalidades do aplicativo.
    - Essa tela de onboarding deve aparecer apenas no primeiro acesso do aplicativo.

### Funcionalidades
  - O Usuário deve poder adicionar um ou mais parceiros de rolê (equivalente a um outro usuário cadastrado no aplicativo).
  - O Usuário deve poder criar um rolê e adicionar parceiros.
  - A Qualquer momento o usuário deve ser capaz de alterar as configurações do rolê
    - Exemplo: Alterar se será pago os 10% do restaurante.
  - Em um rolê, cada participante deve poder adicionar o consumo de algum produto e seu valor.
  - Ao finalizar um rolê, cada participante deve receber o valor que deve ser pago para o estabelecimento.
  - Uma vez que o usuário dono do rolê confirmar que tudo está ok, o rolê é finalizado e mantido no histórico para futura consultas.
  - O Usuário deve poder também, marcar uma tag "Calote!" e escolher quem pagou a conta do caloteiro que será marcado como "Herói!".


- User (Rolezeiro)
- Room (Rolê)
  - N User
  - N Item
- Consumo (Item do Rolê)
