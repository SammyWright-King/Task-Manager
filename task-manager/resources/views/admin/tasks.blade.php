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
                                                    <th>Title</th>
                                                    <th>Description</th>
                                                    <th>Created</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach($tasks as $task)
                                                    <tr>
                                                        <td>{{$loop->iteration}}</td>
                                                        <td>{{$task->title}}</td>
                                                        <td>{{\Illuminate\Support\Str::limit($task->description, 25, '...')  }}</td>
                                                        <td>{{\Illuminate\Support\Carbon::parse($task->created_at)->toDayDateTimeString()  }}</td>
                                                    </tr>
                                                @endforeach
                                            </tbody>
                                        </table>
                                        {{ $tasks->links() }}
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


