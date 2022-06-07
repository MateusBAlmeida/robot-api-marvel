*Settings*
Documentation       Suite de Teste do cadastro de personagens na API da Marvel

Resource    ${EXECDIR}/resources/Base.robot
Library     ${EXECDIR}/resources/factories/Thanos.py
Library     ${EXECDIR}/resources/factories/Deadpool.py

Suite Setup     Super Setup     mateus.belchior.98@gmail.com

*Test Cases*
Deve cadastrar um personagem

    &{personagem}           Factory Thanos

    ${response}             POST New Character  ${personagem}

    Status Should Be        200                 ${response}

Não deve cadastrar com o mesmo nome
    [Tags]      dup

    ${personagem}       Factory Deadpool
    POST New Character  ${personagem}

    ${response}         POST New Character              ${personagem}

    Status Should Be    409                             ${response}
    Should Be Equal     ${response.json()}[error]       Character already exists :(