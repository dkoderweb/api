<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>jQuery Bootstrap Table with DataTables</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <!-- DataTables CSS -->
  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
  <!-- jQuery library -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
  <!-- Popper.js -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <!-- Bootstrap JS -->
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <!-- DataTables JS -->
  <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
</head>
<body>

<div class="container mt-5">

  <table id="example" class="table table-bordered">
    <thead>
      <tr>
        <th>#</th>
        <th>Employee Name</th>
        <th>Gross Salary</th>
        <th>HOurs Rate</th>
        <th>Month Hours</th>
        <th>Calculated Month</th>
        <th>Monthly Salary</th>
        <th>Status</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody>  
        @foreach($salarys as $salary)
        <?php  $daySalary = $salary->salary->gross_salary / 30 ;
            $hourRate = $daySalary / 9;
            $hourRate = number_format($hourRate, 2);  
        ?>
        <?php 
            $hoursWorked = [];
            foreach ($salary->attendance as $attendance) {
                $dateTimeIn = new DateTime($attendance ? $attendance->in_time : '00:00');
                $dateTimeOut = new DateTime($attendance ? $attendance->out_time : '00:00');
            
                $interval = $dateTimeIn->diff($dateTimeOut);
            
                $hours = $interval->h;  
                $minutes = $interval->i; 
            
                $totalHours = $hours + ($minutes / 60);
                $hoursWorked[] = $totalHours;
            }
            $totalHoursWorked = array_sum($hoursWorked);
            
        ?>
      <tr>
        <td>{{$salary->id}}</td>
        <td>{{$salary->employee->name}}</td>
        <td> {{$salary->salary->gross_salary}}</td>
        <td>  {{$hourRate}}   </td>
        <td>   {{$totalHoursWorked}}  </td> 
        <td>{{$salary->calculated_month}}</td>
        <td>{{$salary->month_salary}}</td>
        <td>{{$salary->status}}</td>
        <td> 
        <a href="{{ url('/calculate/' . $salary->id) }}">
            <button type="button" @if($salary->status == 'complated') disabled="disabled" @endif class="btn btn-primary">Calculate</button>
        </a>
        </td>
      </tr>
      @endforeach
      <!-- Add more rows as needed -->
    </tbody>
  </table>
</div>

<script>
  $(document).ready(function() {
    $('#example').DataTable();
  });
</script>

</body>
</html>
