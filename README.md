# Script Backup

O script foi criado originalmente para copiar as gravações de chamadas geradas em um servidor Asterisk para unidade
de rede (Storage).

Inclui a lógica para testar se a unidade de rede está montada corretamente antes de executar a cópia.


## Configurando o script

1- Baixe e copie os arquivos do repositório para o diretório /usr/src/

2- Configure o arquivo config.ini com os dados de montagem da unidade de rede. Segue abaixo um exemplo:
```
IP_SERVIDOR='192.168.10.10'
PATH_REMOTO='\\192.168.10.10\PABX'
PONTO_MONTAGEM='/media/rede/'
USERNAME='usuario'
PASSWORD='password'
DIRETORIO_ORIGEM='/var/spool/asterisk/recording/'
DIRETORIO_DESTINO='/media/rede/<DIRETORIO DESTINO>/'
```

3- Configure no cron o horário no qual o script será executado. No meu exemplo a rotina será executada todo dia às 22:00 horas.

`# crontab -e`

Inclua a linha abaixo no fim da configuração do crontab, salve e feche o editor.

`00 22 * * *root /usr/src/script_backup/main.sh`