<?php

namespace App\Command;
use App\Models\Node;
use App\Models\User;
use App\Models\NodeInfoLog;
use App\Models\NodeOnlineLog;
use App\Models\TrafficLog;
use App\Services\Config;
use App\Utils\Tools;


class Job
{
	
		public static function DailyJob()
    {
				
			$users = User::all();
			foreach($users as $user){
				
				if(date("d")==$user->auto_reset_day)
				{
					$user->u=0;
					$user->d=0;
					$user->save();
				}
				
				if(date("Y-m-d")==$user->expire_at && ($user->user_class!=0 || $user->node_group!=0) )
				{
					$user->user_class=0;
					$user->node_group=0;
					$user->transfer_enable = Tools::toGB(Config::get('defaultTraffic'));
					$user->save();
				}				
			}
		}	

}
