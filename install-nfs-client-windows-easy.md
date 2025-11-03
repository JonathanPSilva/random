# Instalação do Cliente NFS no Windows

## Pré-requisitos
- Windows Server 2012 ou superior
- Windows 10 Professional ou superior
- Acesso administrativo ao sistema
- PowerShell com privilégios elevados

## Instalação:
```powershell
Install-WindowsFeature -Name NFS-Client
```

## Desinstalação
Se necessário, remova o recurso com:
```powershell
Remove-WindowsFeature -Name NFS-Client
```
