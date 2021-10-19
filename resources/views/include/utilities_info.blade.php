<script>
    var utilities = [
        @foreach(getUtilities() as $item)
        {
            "name": "{{$item['name']}}",
            "photo": "{{$item['photo']}}",
            "nameHotspot": "{{$item['nameHotspot']}}",
            "id": "{{$item['id']}}",
        },
        @endforeach
    ];
</script>
