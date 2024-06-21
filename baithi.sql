select a.manganh, count(a.manganh) as N'Số lượng sinh viên của ngành đã tuyển sinh',
case 
when count(a.manganh) > 300 Then N'Ngành Thế mạnh'
else N'Ngành Tiềm năng'
end as N'trạng thai' from sinhvien as a join nganh as b
on a.manganh=b.manganh
group by a.manganh
