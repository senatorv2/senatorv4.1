
local function delmsg (arg,data)
    for k,v in pairs(data.messages_) do
        tg.deleteMessages(v.chat_id_,{[0] = v.id_}, dl_cb, cmd)
    end
end
local function run(msg, matches)
    local chat_id = msg.chat_id_
    local msg_id = msg.id_
    local group = load_data('bot/group.json')
    local addgroup = group[tostring(msg.chat_id)]
    if addgroup and is_owner(msg) then
    if matches[1] == 'rmsg' then
                if tonumber(matches[2]) > 100 or tonumber(matches[2]) < 1 then
                    pm = '*More than* 1 *and less than* 100'
                   tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md') 
                else
                    tg.getChatHistory(chat_id, msg_id, 0, tonumber(matches[2]), delmsg, nil)
                    pm = '*Message Has Been Removed*'
                    tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
                end
     end
end
end

return {
    patterns = {
        '^[!#/]([Rr]msg) (%d*)$',
    },
    run = run,
 --   msg_processor = msg_processor
}
