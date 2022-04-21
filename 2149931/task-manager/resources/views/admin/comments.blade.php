@extends('admin.layout.include')

@section('content')
    <!-- partial -->
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="row">
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <p class="card-title">All Tasks</p>
                            <div class="row">
                                <div class="col-12">
                                    <div class="table-responsive">
                                        <table id="example" class="display expandable-table" style="width:100%">
                                            <thead>
                                            <tr>
                                                <th>id#</th>
                                                <th>Name</th>
                                                <th>Task</th>
                                                <th>Comment</th>
                                                <th>Created</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            @foreach($comments as $comment)
                                                <tr>
                                                    <td>{{$loop->iteration}}</td>
                                                    <td>{{$comment->user->first_name}} {{$comment->user->last_name}}</td>
                                                    <td>{{$comment->task->title}}</td>
                                                    <td>{{\Illuminate\Support\Str::limit($comment->comment, 25, '...')  }}</td>
                                                    <td>{{\Illuminate\Support\Carbon::parse($comment->created_at)->toDayDateTimeString()  }}</td>
                                                </tr>
                                            @endforeach
                                            </tbody>
                                        </table>
                                        {{ $comments->links() }}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
