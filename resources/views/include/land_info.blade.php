<script>
    var lands = [
        @foreach(getLand() as $item)
        {
            "id": "{{$item['id']}}",
            "name": "{{$item['name']}}",
            "content": `{{$item['content']}}`,
            "nameLand": "{{$item['nameLand']}}",
            "status": "{{$item['status']}}"
        },
        @endforeach
    ];
</script>
