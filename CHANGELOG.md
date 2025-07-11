# Changelog

## [feature/infra-monitoring-autoscaling] - 2025-07-11

### ✨ Novos Módulos
- **monitoring**: Criação de instância EC2 com Grafana e Prometheus.
  - ALB configurado para expor o Grafana na porta 80.
  - Password do admin configurado via Terraform.
- **autoscaling**: Auto Scaling Group com Launch Template.
  - Instâncias EC2 executando imagem Docker personalizada.
  - Segurança e subnets configuradas via VPC e EC2.
- **iam**: Módulo para criação de `IAM Instance Profile` usado pelo Launch Template.

### ♻️ Refatorações
- Ajustes no módulo **ec2**:
  - Exporta `security_group_id` para permitir uso em outros módulos.
  - Permite configuração mais flexível via variáveis.

### ⚙️ Infraestrutura
- Integração completa dos novos módulos no `main.tf` do ambiente `dev`.
- Variáveis centralizadas no `terraform.tfvars`.
- Atualização no `user_data.sh.tpl` para instalação automatizada de Grafana e Prometheus com versão configurável.

---

> Obs: Recursos foram removidos e reimplantados via `terraform destroy` e `terraform apply` para evitar conflitos e cobranças indevidas durante o desenvolvimento.
