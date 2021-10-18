<option value="{{$data->id}}" {{ $category_id==$data->id ? 'selected' : '' }}>@for ( $i = 0; $i < $level; $i++) -- @endfor{{$data->name}}</option>
@if(count($data->categories) > 0)
@foreach ($data->categories as $data)
@include('admin.category.option', ['data' => $data, 'level' => ($level+1), 'category_id' => $category_id])
@endforeach
@endif
