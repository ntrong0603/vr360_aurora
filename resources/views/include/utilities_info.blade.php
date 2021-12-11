<script>
    var utilities = [
        @foreach(getUtilities() as $item)
        {
            "name": "{{$item['name']}}",
            "photo": "{{$item['photo']}}",
            "nameHotspot": "{{$item['nameHotspot']}}",
            "content": "{!!$item['content']!!}",
            "id": "{{$item['id']}}",
        },
        @endforeach
    ];
</script>
