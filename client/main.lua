Citizen.CreateThread(function()
	local ESX = exports['es_extended']:getSharedObject()
	local MenuType = 'default'

	local openMenu = function(namespace, name, data)
		SendNUIMessage({
			action = 'openMenu',
			namespace = namespace,
			name = name,
			data = data
		})
	end

	local closeMenu = function(namespace, name)
		SendNUIMessage({
			action = 'closeMenu',
			namespace = namespace,
			name = name,
			data = data
		})
	end

	ESX.UI.Menu.RegisterType(MenuType, openMenu, closeMenu)

	RegisterNUICallback('menu_submit', function(data, cb)
		local menu = ESX.UI.Menu.GetOpened(MenuType, data._namespace, data._name)
		if menu.submit then
			menu.submit(data, menu)
		end
		cb('OK')
	end)

	RegisterNUICallback('menu_cancel', function(data, cb)
		local menu = ESX.UI.Menu.GetOpened(MenuType, data._namespace, data._name)

		if menu.cancel then
			menu.cancel(data, menu)
		end
		cb('OK')
	end)

	RegisterNUICallback('menu_change', function(data, cb)
		local menu = ESX.UI.Menu.GetOpened(MenuType, data._namespace, data._name)

		for i=1, #data.elements, 1 do
			menu.setElement(i, 'value', data.elements[i].value)
			menu.setElement(i, 'selected', data.elements[i].selected and true)
		end

		if menu.change then
			menu.change(data, menu)
		end
		cb('OK')
	end)

	local function sendNuiMessage(key)
		SendNUIMessage({action = 'controlPressed', control = key})
		Wait(200)
	end

	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(15)
			if IsControlPressed(0, 18) then
				sendNuiMessage('ENTER')
			elseif IsControlPressed(0, 177) then
				sendNuiMessage('BACKSPACE')
			elseif IsControlPressed(0, 27) then
				sendNuiMessage('TOP')
			elseif IsControlPressed(0, 173) then
				sendNuiMessage('DOWN')
			elseif IsControlPressed(0, 174) then
				sendNuiMessage('LEFT')
			elseif IsControlPressed(0, 175) then
				sendNuiMessage('RIGHT')
			end
		end
	end)
end)
