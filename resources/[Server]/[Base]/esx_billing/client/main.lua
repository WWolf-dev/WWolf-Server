local isDead = false

function ShowBillsMenu()
	ESX.TriggerServerCallback('esx_billing:getBills', function(bills)
		if #bills > 0 then
			local elements = {}

			for k,v in ipairs(bills) do
				elements[#elements+1] = {
					title = ('%s - <span style="color:red;">%s</span>'):format(v.label, TranslateCap('invoices_item', ESX.Math.GroupDigits(v.amount))),
					icon = "fas fa-scroll",
					onSelect = function()
						ESX.TriggerServerCallback('esx_billing:payBill', function()
							ShowBillsMenu()
						end,  v.id)
					end
				}
			end

			lib.registerContext({
				id = "esx_billing:ox_lib:billingMenu",
				title = TranslateCap('invoices'),
				options = elements,
			})
			lib.showContext("esx_billing:ox_lib:billingMenu")
		else
			lib.notify({
				id = "esx_billing:ox_lib:no_invoices",
				title = TranslateCap('no_invoices'),
				icon = "fas fa-scroll",
				duration = 3500,
				position = 'bottom',
				type = 'error'
			})
		end
	end)
end

RegisterCommand('showbills', function()
	if not isDead then
		ShowBillsMenu()
	end
end, false)

lib.addKeybind({
	name = "showbills",
	description = TranslateCap('keymap_showbills'),
	defaultKey = "F7",
	onReleased = function()
		ShowBillsMenu()
	end
})

AddEventHandler('esx:onPlayerDeath', function() isDead = true end)
AddEventHandler('esx:onPlayerSpawn', function(spawn) isDead = false end)
