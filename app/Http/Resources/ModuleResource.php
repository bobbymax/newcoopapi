<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ModuleResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'label' => $this->label,
            'parentId' => $this->parentId,
            'parent' => $this->parentId > 0 ? $this->parent->label : 'none',
            'type' => $this->type,
            'url' => $this->url,
            'icon' => $this->icon,
            'code' => $this->code,
            'roles' => $this->roles->pluck('label')->toArray(),
            'children' => $this->children,
            'created_at' => $this->created_at->format('d F Y'),
            'updated_at' => $this->updated_at->format('d F Y')
        ];
    }
}
