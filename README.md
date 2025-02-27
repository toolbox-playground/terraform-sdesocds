# Turma 01 - Desafio do nosso curso

## Desafio Terraform AWS: Construção de uma Aplicação Web Altamente Disponível

### Objetivo

Sua tarefa é projetar e implantar uma aplicação web altamente disponível na AWS usando Terraform. Você precisará provisionar os componentes necessários da infraestrutura para garantir redundância, escalabilidade e segurança.  

### Requisitos

#### 1. Rede  
- Criar uma VPC com pelo menos duas subnets públicas e duas privadas distribuídas em múltiplas Zonas de Disponibilidade;  
- Definir e anexar um Internet Gateway à VPC;  
- Configurar Tabelas de Rotas para garantir o roteamento adequado entre as subnets públicas e privadas.  

#### 2. Computação (EC2)
- Implantar um Auto Scaling Group (ASG) com pelo menos duas instâncias EC2 distribuídas entre diferentes Zonas de Disponibilidade;  
- Usar um Application Load Balancer (ALB) para distribuir o tráfego entre as instâncias;  
- Garantir que as IAM Roles e Security Groups estejam configurados corretamente com privilégios mínimos necessários.  

#### 3. Armazenamento
- Anexar um volume EBS (Elastic Block Store) a cada instância EC2;  
- Configurar um bucket S3 para armazenar arquivos estáticos da aplicação.

#### 4. Banco de Dados
- Implantar um banco de dados Amazon RDS (PostgreSQL ou MySQL) em uma subnet privada;  
- Habilitar a configuração Multi-AZ para alta disponibilidade.

#### 5. Segurança e Monitoramento
- Implementar Security Groups e Network ACLs para restringir acessos desnecessários;  
- Habilitar CloudWatch para monitoramento das instâncias EC2;  
- Configurar IAM Roles e Policies seguindo o princípio de menor privilégio.

#### 6. Pipeline
- Implementar pipeline com pelo menos dois stages (PLAN, APPLY)  
- Adicionar alguma ferramenta de validação de código  

## Tarefas Bônus 🎯

✅ Implementar Módulos do Terraform para estruturar melhor o código;  
✅ Armazenar o state do Terraform em um bucket S3 com DynamoDB para bloqueio do state;  
✅ Utilizar Outputs do Terraform para exibir a URL do Load Balancer e o endpoint do banco de dados.

## Entregáveis Esperados 📂
- Arquivos .tf bem estruturados e reutilizáveis;  
- O state do Terraform deve ser armazenado remotamente;  
- Um README.md explicando como implantar a infraestrutura;  
- Uma captura de tela ou link mostrando a aplicação rodando.

## Critérios de Sucesso ✅
✔ A implantação deve ser totalmente automatizada via Terraform;  
✔ A aplicação web deve estar acessível via a URL do ALB;  
✔ O banco de dados deve estar acessível apenas nas subnets privadas;  
✔ A solução deve seguir as melhores práticas da AWS para segurança e alta disponibilidade.

# Boa sorte! 🚀

Após concluir o desafio, teste sua infraestrutura, destrua os recursos usando terraform destroy e garanta que seu código seja reutilizável para futuras implantações.  
