<tr>
    <td>
        @for ( $i = 0; $i < $level; $i++) -- @endfor {{$data->name}}
    </td>
    <td class="text-center">
        <a href="{{ route('category.edit', ['category' => $data->id]) }}">
            <i class="fas fa-pencil-alt text-warning"></i>
        </a>
    </td>
    <td class="text-center">
        <a class="delete-row" href="javascript:;" data-href="{{ route('category.delete', ['category' => $data->id]) }}">
            <i class="far fa-trash-alt text-danger"></i>
        </a>
    </td>
</tr>
@if(count($data->categories) > 0)
@foreach ($data->categories as $data)
@include('admin.category.row_table', ['data' => $data, 'level' => ($level+1)])
@endforeach
@endif
