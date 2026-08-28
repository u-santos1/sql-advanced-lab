# 1. Base Image: Versão Alpine (Extremamente leve)
FROM postgres:15-alpine

# 2. Otimização de Cache: Instruções que mudam pouco ficam no topo.
# Definimos variáveis de ambiente globais.
ENV TZ=America/Sao_Paulo

# 3. Segurança (Non-Root User) e Permissões
# A imagem oficial já cria o usuário 'postgres', mas é uma boa prática
# garantir que os arquivos copiados pertençam a ele (evitando falhas de permissão)
# e forçar a execução do container com este usuário sem privilégios de root.
COPY --chown=postgres:postgres ./schema.sql /docker-entrypoint-initdb.d/1_schema.sql
COPY --chown=postgres:postgres ./seed.sql /docker-entrypoint-initdb.d/2_seed.sql

USER postgres

# 4. Otimizações de Memória no CMD
CMD ["postgres", "-c", "shared_buffers=256MB", "-c", "work_mem=16MB", "-c", "maintenance_work_mem=64MB"]
