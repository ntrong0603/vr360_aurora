<script>
    var scenes = [
        @foreach(getScene() as $scene)
        {
            "name": "{{$scene['name']}}",
            "content": "{{$scene['content']}}",
            "nameScene": "{{$scene['nameScene']}}",
            "id": "{{$scene['id']}}",
        },
        @endforeach
    ];
</script>
