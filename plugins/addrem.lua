local function addgroup(msg)
local group = load_data('bot/group.json')
local groupa = group[tostring(msg.chat_id)]
if not groupa then
group[tostring(msg.chat_id)] = {
        group_type = 'SuperGroup',
		by = msg.from_id,
		moderators = {},
        set_owner = member_id ,
        settings = {
		  lock_link = "no",
lock_username = "no",
lock_edit = "no",
lock_fwd = "no",
lock_spam = "no",
lock_tag = "no",
lock_fosh = "no",
lock_inline ="no",
lock_bot ="no",				
--lock_flood = "no",				
lock_sticker = "no",				
lock_english = "no",
lock_persian = "no",
lock_tgservice = "no",
lock_sticker = "no",
mute_all = "no",
mute_photo = "no",
mute_video = "no",
mute_voice = "no",
mute_document = "no",
mute_gif = "no",
mute_audio = "no"
                  }
      }
      save_data(_config.group.data, group)
tg.sendMessage(msg.chat_id, msg.id_, 1, 'Group has been added', 1)
else
tg.sendMessage(msg.chat_id, msg.id_, 1, 'Group already exists', 1)
end
end
local function remgroup(msg)
local group = load_data('bot/group.json')
local groupa = group[tostring(msg.chat_id)]
if groupa then
group[tostring(msg.chat_id)] = nil
      save_data(_config.group.data, group)
tg.sendMessage(msg.chat_id, msg.id_, 1, 'Group has been removed', 1)
else
tg.sendMessage(msg.chat_id, msg.id_, 1, 'Group not added', 1)
end
end

local function run(msg, matches)
if matches[1] == 'add' and is_sudo(msg) then
addgroup(msg)
elseif matches[1] == 'rem' and is_sudo(msg) then
remgroup(msg)
end
if matches[1] == 'setrules' and is_owner(msg) or is_momod(msg) and groupa then
redis:set('rules'..msg.chat_id_,matches[2])
tg.sendMessage(msg.chat_id_, 0, 1, '<b>Group Rules Saved</b>', 1, 'html')
end		
end
return {
  patterns = {
    "^[/#!](add)$",
    "^[/#!](rem)$",
	"^[/#!](setrules) (.*)$",	
"^!!!edit:[/#!](add)$",
    "^!!!edit:[/#!](rem)$"
  },
  run = run
}

