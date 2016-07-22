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
			
			$user->last_day_t=($user->u+$user->d);
			$user->save();
				
				
			if(date("d")==$user->auto_reset_day)
			{
				$user->u=0;
				$user->d=0;
				$user->usedTraffic()=0;
				$user->save();
			}
		}
		}	

}
