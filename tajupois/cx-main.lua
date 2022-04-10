local tajupois = false
local odotus = 15
local laskuri = 60

Citizen.CreateThread(function()
	while true do
		Wait(1)
		local pelaaja = GetPlayerPed(-1)
		if IsPedInMeleeCombat(pelaaja) then
			if GetEntityHealth(pelaaja) < 115 then
				SetPlayerInvincible(PlayerId(), true)
				StartScreenEffect('DrugsDrivingIn', 1000, true)
				SetPedToRagdoll(pelaaja, 1000, 1000, 0, 0, 0, 0) 			
				ShowNotification("~r~Sait osuman lasileukaasi ja taju lähti!")
				odotus = 15
				tajupois = true
				SetEntityHealth(pelaaja, 116)
			end
	end
		if tajupois == true then
			SetPlayerInvincible(PlayerId(), true)
			DisablePlayerFiring(PlayerId(), true)
			SetPedToRagdoll(pelaaja, 1000, 1000, 0, 0, 0, 0)
			ResetPedRagdollTimer(pelaaja)
			if odotus >= 0 then
				laskuri = laskuri - 1
				if laskuri == 0 then
					laskuri = 60
					odotus = odotus - 1
					SetEntityHealth(pelaaja, GetEntityHealth(pelaaja)+4)
				end
			else
				SetPlayerInvincible(PlayerId(), false)
				StopScreenEffect("DrugsDrivingIn")
				tajupois = false
			end
		end
	end
end)

function ShowNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end
