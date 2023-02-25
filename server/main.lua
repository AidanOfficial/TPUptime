Citizen.CreateThread(function()
  -- Start Game Timer
  local uptimeStart = GetGameTimer()

  while true do
    -- Every Minute
    Citizen.Wait(1000 * 60)

    -- Get Uptime
    local uptimeCurrent = GetGameTimer()
    local uptimeDays = math.floor((uptimeCurrent - uptimeStart) / 86400000)
    local uptimeHours = math.floor((uptimeCurrent - uptimeStart) / 3600000) % 24
    local uptimeMinutes = math.floor((uptimeCurrent - uptimeStart) / 60000) % 60

    -- Format the uptime
    uptime = string.format("%02d:%02d:%02d", uptimeDays, uptimeHours, uptimeMinutes)

    -- Set server convar
    SetConvarServerInfo('Uptime', uptime)

    -- Start events
    TriggerClientEvent('uptime:tick', -1, uptime)
    TriggerEvent('uptime:tick', uptime)
  end
end)
