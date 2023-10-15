#!/bin/bash

charge_level="$(cat /sys/class/power_supply/BAT0/capacity)"
ac_adapter="$(cat /sys/class/power_supply/AC/online)"

# Verificando se bateria esta desconectada
if [[ ac_adapter -eq 0 ]]; then 
  # Verificando se o nivel da bateria é menor que 30%, Caso sim, liga tomada.
  if [[ charge_level -le 30 ]]; then 
    echo "Bateria em nivel de alerta:" $charge_level "% Habilitando tomada !"
  else 
    echo "Bateria ainda esta de boas:" $charge_level "%"
  fi 

# Verificando se bateria esta conectada e se o nivel da bateria esta maior que 90%
# Se sim desliga a tomada.
elif [[ ac_adapter -eq 1 ]]; then
  if [[ charge_level -ge 90 ]]; then
    echo "Bateria carregada mais de:" $charge_level "%. Desligando tomada!"
  else
    echo "Ainda esta carregando !" $charge_level "%."
  fi
else
  echo "Mano tem algo errado, da uma olhada ai !"
fi