<?php

namespace App\Console\Commands;

use App\Models\Contribution;
use App\Models\Module;
use App\Models\Role;
use App\Models\User;
use App\Models\Wallet;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Hash;

class InstallAdminUser extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'admin:install';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     */
    public function handle(): void
    {
        $this->info('Adding Admin Role!!');
        $role = $this->addAdminRole();
        $this->info('Loading admin user');
        $user = $this->superAdmin();
        $this->info('Saving required modules');
        $this->saveModules($role);
        $this->addRoleToUser($role, $user);
        $this->info('All Done!!!, Make Something Amazing');
    }

    protected function superAdmin()
    {
        $user =  User::create([
            'membership_no' => 'AD001',
            'staff_no' => 'ADMIN',
            'firstname' => 'Super',
            'surname' => 'Administrator',
            'mobile' => '09093479079',
            'contribution_fee' => 60000,
            'type' => 'admin',
            'status' => 'active',
            'email' => 'admin@admin.com',
            'password' => Hash::make('password'),
            'verified' => true,
        ]);

        if ($user) {
            Wallet::create([
                'user_id' => $user->id,
                'savings' => $user->contribution_fee,
            ]);

            Contribution::create([
                'user_id' => $user->id,
                'fee' => $user->contribution_fee,
                'month' => 'april',
                'status' => 'active',
                'current' => true
            ]);
        }

        return $user;
    }

    protected function addAdminRole()
    {
        return Role::create([
            'name' => 'Super Administrator',
            'label' => 'super-administrator',
            'slot' => 1
        ]);
    }

    protected function saveModules($role): void
    {

        foreach ($this->modules() as $obj)
        {
            $module = Module::create([
                'name' => $obj['name'],
                'label' => $obj['label'],
                'code' => $obj['code'],
                'icon' => $obj['icon'],
                'url' => $obj['url'],
                'parentId' => $obj['parentId'],
                'type' => $obj['type'],
            ]);
            $module->roles()->save($role);
        }

    }

    protected function addRoleToUser($role, $user)
    {
        return $user->roles()->save($role);
    }

    protected function modules(): array
    {
        return [
            [
                'name' => 'Administration',
                'label' => 'administration',
                'code' => 'ADM',
                'icon' => 'engineering',
                'url' => '/administration',
                'parentId' => 0,
                'type' => 'application',
            ],
            [
                'name' => 'Configuration',
                'label' => 'configuration',
                'code' => 'CNF',
                'icon' => 'construction',
                'url' => '/administration/configuration',
                'parentId' => 1,
                'type' => 'module',
            ],
            [
                'name' => 'Import',
                'label' => 'import',
                'code' => 'IMP',
                'icon' => 'upload',
                'url' => '/administration/import',
                'parentId' => 2,
                'type' => 'page',
            ],
            [
                'name' => 'Settings',
                'label' => 'settings',
                'code' => 'STS',
                'icon' => 'settings',
                'url' => '/administration/settings',
                'parentId' => 2,
                'type' => 'page',
            ]
        ];
    }
}
