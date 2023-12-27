<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class admministrator extends Model
{
    use HasFactory;
    protected $table = 'administrator';
    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    public function aiticle()
    {
        return $this->haveMany(Article::class);
    }

    public function comments()
    {
        return $this->haveMany(Comments::class);
    }

    public function votelist()
    {
        return $this->haveMany(Vote::class);
    }
}
