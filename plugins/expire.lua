local function pre_process(msg)
 msg.text = msg.content_.text
	local timetoexpire = 'unknown'
	local expiretime = redis:hget ('expiretime', msg.chat_id_)
	local now = tonumber(os.time())
	if expiretime then    
		timetoexpire = math.floor((tonumber(expiretime) - tonumber(now)) / 86400) + 1
		if tonumber("0") > tonumber(timetoexpire) and not is_sudo(msg) then
		if msg.text:match('/') or msg.text:match('!') or msg.text:match('#') then
			return --tg.sendMessage(msg.chat_id_, 0, 1, '*ExpireTime Ended.*', 1, 'md')
		else
			return
		end
	end
	if tonumber(timetoexpire) == 0 then
		if redis:hget('expires0',msg.chat_id_) then end
		tg.sendMessage(msg.chat_id_, 0, 1, ' `به پایان تاریخ انقضای گروه فقط 0 روز دیگر باقی مانده است. لطفا برای تمدید سریعاً اقدام کنید` .', 1, 'md')
		redis:hset('expires0',msg.chat_id_,'5')
	end
	if tonumber(timetoexpire) == 1 then
		if redis:hget('expires1',msg.chat_id_) then end
		tg.sendMessage(msg.chat_id_, 0, 1, ' `به پایان تاریخ انقضای گروه فقط 1 روز دیگر باقی مانده است. لطفا برای تمدید اقدام کنید` .', 1, 'md')
		redis:hset('expires1',msg.chat_id_,'5')
	end
	if tonumber(timetoexpire) == 2 then
		if redis:hget('expires2',msg.chat_id_) then end
		tg.sendMessage(msg.chat_id_, 0, 1, ' `به پایان تاریخ انقضای گروه فقط 2 روز دیگر باقی مانده است. لطفا برای تمدید اقدام کنید` .', 1, 'md')
		redis:hset('expires2',msg.chat_id_,'5')
	end
	if tonumber(timetoexpire) == 3 then
		if redis:hget('expires3',msg.chat_id_) then end
		tg.sendMessage(msg.chat_id_, 0, 1, ' `به پایان تاریخ انقضای گروه فقط 3 روز دیگر باقی مانده است. لطفا برای تمدید اقدام کنید` ', 1, 'md')
		redis:hset('expires3',msg.chat_id_,'5')
	end
	if tonumber(timetoexpire) == 4 then
		if redis:hget('expires4',msg.chat_id_) then end
		tg.sendMessage(msg.chat_id_, 0, 1, ' `به پایان تاریخ انقضای گروه فقط 4 روز دیگر باقی مانده است. لطفا برای تمدید اقدام کنید` ', 1, 'md')
		redis:hset('expires4',msg.chat_id_,'5')
	end
	if tonumber(timetoexpire) == 5 then
		if redis:hget('expires5',msg.chat_id_) then end
		tg.sendMessage(msg.chat_id_, 0, 1, ' `به پایان تاریخ انقضای گروه فقط 5 روز دیگر باقی مانده است. لطفا برای تمدید اقدام کنید` ', 1, 'md')
		redis:hset('expires5',msg.chat_id_,'5')
	end
end

end
function run(msg, matches)
	if matches[1]:lower() == 'setexpire' then
		if not is_sudo(msg) then return end
		local time = os.time()
		local buytime = tonumber(os.time())
		local timeexpire = tonumber(buytime) + (tonumber(matches[2]) * 86400)
		redis:hset('expiretime',msg.chat_id_,timeexpire)
		text = '*Expire Time Set* [`'..matches[2]..'`] *Days* '
		tg.sendMessage(msg.chat_id_, 0, 1, text, 1, 'md')
	end
	if matches[1]:lower() == 'expire' then
		local expiretime = redis:hget ('expiretime', msg.chat_id_)
		if not expiretime then return '*Unlimited*' else
			local now = tonumber(os.time())
			text1 = (math.floor((tonumber(expiretime) - tonumber(now)) / 86400) + 1) 
			tg.sendMessage(msg.chat_id_, 0, 1, '*Expire Time* [`'..text1..'`] *Days*', 1, 'md')
		end
	end

end
return {
  patterns = {
    "^[#!/]([Ss]etexpire) (.*)$",
	"^[!#/]([Ee]xpire)$",
  },
  run = run,
  pre_process = pre_process
}
