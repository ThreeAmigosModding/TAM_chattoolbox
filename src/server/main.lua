if config.EnableFilter then
  AddEventHandler('chatMessage', function(source, name, message)
      CancelEvent()
      local src = source
      local blacklistMsg, msg = checkList(message)

      if not blacklistMsg then
        TriggerClientEvent('chatMessage', -1, name, { 255, 255, 255 }, message)
      else
        TriggerClientEvent('chatMessage', -1, string.format(config.FilterMessage, msg))
        discordWebhook(src, msg)
      end
  end)

  function checkList(str)
      local blacklist = false
      local word = nil

      for word in ipairs(config.filteredWords) do
          if string.match(string.lower(str), config.filteredWords[word]) then
            blacklist = true
            word = config.filteredWords[word]
          else
              if blacklist == true then
                blacklist = true
              else
                blacklist = false
              end
          end
      end
      return blacklist, word
  end

  function discordWebhook(user, message)
      local embed = {
          {
          ["color"] = serverConfig.color,
          ["title"] = "**[#".. user .. "] " .. GetPlayerName(user) .."**",
          ["description"] = message,
          ["footer"] = {
              ["text"] = serverConfig.footer,
          },
          }
      }
      PerformHttpRequest(serverConfig.webhookURL, function(err, text, headers) end, 'POST', json.encode({username = GetPlayerName(user), embeds = embed, avatar_url = serverConfig.avatarURL}), { ['Content-Type'] = 'application/json' })
  end
end