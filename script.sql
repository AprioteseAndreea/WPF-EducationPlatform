USE [master]
GO
/****** Object:  Database [EducationPlatform]    Script Date: 28.05.2021 22:00:15 ******/
CREATE DATABASE [EducationPlatform]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EducationPlatform', FILENAME = N'D:\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EducationPlatform.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EducationPlatform_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EducationPlatform_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EducationPlatform] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EducationPlatform].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EducationPlatform] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EducationPlatform] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EducationPlatform] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EducationPlatform] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EducationPlatform] SET ARITHABORT OFF 
GO
ALTER DATABASE [EducationPlatform] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EducationPlatform] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EducationPlatform] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EducationPlatform] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EducationPlatform] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EducationPlatform] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EducationPlatform] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EducationPlatform] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EducationPlatform] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EducationPlatform] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EducationPlatform] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EducationPlatform] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EducationPlatform] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EducationPlatform] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EducationPlatform] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EducationPlatform] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EducationPlatform] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EducationPlatform] SET RECOVERY FULL 
GO
ALTER DATABASE [EducationPlatform] SET  MULTI_USER 
GO
ALTER DATABASE [EducationPlatform] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EducationPlatform] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EducationPlatform] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EducationPlatform] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EducationPlatform] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EducationPlatform] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'EducationPlatform', N'ON'
GO
ALTER DATABASE [EducationPlatform] SET QUERY_STORE = OFF
GO
USE [EducationPlatform]
GO
/****** Object:  Table [dbo].[absence]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[absence](
	[id_subject] [int] NOT NULL,
	[id_student] [int] NOT NULL,
	[id_semester] [int] NOT NULL,
	[id_teacher] [int] NOT NULL,
	[date] [varchar](50) NOT NULL,
	[state] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[class]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[class](
	[id_class] [int] NOT NULL,
	[id_class_master] [int] NOT NULL,
	[specialization] [varchar](50) NULL,
	[study_year] [int] NULL,
 CONSTRAINT [PK_class] PRIMARY KEY CLUSTERED 
(
	[id_class] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[class_master]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[class_master](
	[id_class_master] [int] NOT NULL,
	[id_teacher] [int] NOT NULL,
 CONSTRAINT [PK_class_master] PRIMARY KEY CLUSTERED 
(
	[id_class_master] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[class_subject]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[class_subject](
	[id_class] [int] NULL,
	[id_subject] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[material]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[material](
	[id_teacher] [int] NOT NULL,
	[path] [varchar](150) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[semester]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[semester](
	[id_semester] [int] NOT NULL,
	[semester] [int] NOT NULL,
	[year] [int] NOT NULL,
 CONSTRAINT [PK_semester] PRIMARY KEY CLUSTERED 
(
	[id_semester] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[id_student] [int] NOT NULL,
	[student_name] [varchar](50) NULL,
	[birth_date] [varchar](50) NULL,
 CONSTRAINT [PK_student] PRIMARY KEY CLUSTERED 
(
	[id_student] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_class]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_class](
	[id_student] [int] NULL,
	[id_class] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_subject_average]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_subject_average](
	[id_student] [int] NOT NULL,
	[id_subject] [int] NOT NULL,
	[id_semester] [int] NOT NULL,
	[average] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subject]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subject](
	[id_subject] [int] NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_subject] PRIMARY KEY CLUSTERED 
(
	[id_subject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subject_student_mark]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subject_student_mark](
	[id_subject] [int] NULL,
	[id_student] [int] NULL,
	[id_semester] [int] NULL,
	[mark] [int] NULL,
	[date] [varchar](50) NULL,
	[is_thesis] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teacher]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teacher](
	[id_teacher] [int] NOT NULL,
	[teacher_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_teacher] PRIMARY KEY CLUSTERED 
(
	[id_teacher] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teacher_subject_class]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teacher_subject_class](
	[id_teacher] [int] NOT NULL,
	[id_subject] [int] NOT NULL,
	[id_class] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[thesis]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thesis](
	[id_subject] [int] NOT NULL,
	[id_class] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[absence]  WITH CHECK ADD  CONSTRAINT [FK_absence_teacher] FOREIGN KEY([id_teacher])
REFERENCES [dbo].[teacher] ([id_teacher])
GO
ALTER TABLE [dbo].[absence] CHECK CONSTRAINT [FK_absence_teacher]
GO
ALTER TABLE [dbo].[absence]  WITH CHECK ADD  CONSTRAINT [fkey_absence_semester] FOREIGN KEY([id_semester])
REFERENCES [dbo].[semester] ([id_semester])
GO
ALTER TABLE [dbo].[absence] CHECK CONSTRAINT [fkey_absence_semester]
GO
ALTER TABLE [dbo].[absence]  WITH CHECK ADD  CONSTRAINT [fkey_absence_student] FOREIGN KEY([id_student])
REFERENCES [dbo].[student] ([id_student])
GO
ALTER TABLE [dbo].[absence] CHECK CONSTRAINT [fkey_absence_student]
GO
ALTER TABLE [dbo].[absence]  WITH CHECK ADD  CONSTRAINT [fkey_absence_subject] FOREIGN KEY([id_subject])
REFERENCES [dbo].[subject] ([id_subject])
GO
ALTER TABLE [dbo].[absence] CHECK CONSTRAINT [fkey_absence_subject]
GO
ALTER TABLE [dbo].[class]  WITH CHECK ADD  CONSTRAINT [FK_class_master] FOREIGN KEY([id_class_master])
REFERENCES [dbo].[class_master] ([id_class_master])
GO
ALTER TABLE [dbo].[class] CHECK CONSTRAINT [FK_class_master]
GO
ALTER TABLE [dbo].[class_master]  WITH CHECK ADD  CONSTRAINT [fkey_class_master_teacher_id] FOREIGN KEY([id_teacher])
REFERENCES [dbo].[teacher] ([id_teacher])
GO
ALTER TABLE [dbo].[class_master] CHECK CONSTRAINT [fkey_class_master_teacher_id]
GO
ALTER TABLE [dbo].[class_subject]  WITH CHECK ADD  CONSTRAINT [FK_class_subject_subject] FOREIGN KEY([id_subject])
REFERENCES [dbo].[subject] ([id_subject])
GO
ALTER TABLE [dbo].[class_subject] CHECK CONSTRAINT [FK_class_subject_subject]
GO
ALTER TABLE [dbo].[class_subject]  WITH CHECK ADD  CONSTRAINT [fkey_class_subject_class] FOREIGN KEY([id_class])
REFERENCES [dbo].[class] ([id_class])
GO
ALTER TABLE [dbo].[class_subject] CHECK CONSTRAINT [fkey_class_subject_class]
GO
ALTER TABLE [dbo].[student_class]  WITH CHECK ADD  CONSTRAINT [FK_student_class_class] FOREIGN KEY([id_class])
REFERENCES [dbo].[class] ([id_class])
GO
ALTER TABLE [dbo].[student_class] CHECK CONSTRAINT [FK_student_class_class]
GO
ALTER TABLE [dbo].[student_class]  WITH CHECK ADD  CONSTRAINT [FK_student_class_student] FOREIGN KEY([id_student])
REFERENCES [dbo].[student] ([id_student])
GO
ALTER TABLE [dbo].[student_class] CHECK CONSTRAINT [FK_student_class_student]
GO
ALTER TABLE [dbo].[student_subject_average]  WITH CHECK ADD  CONSTRAINT [FK_student_subject_average_semester] FOREIGN KEY([id_semester])
REFERENCES [dbo].[semester] ([id_semester])
GO
ALTER TABLE [dbo].[student_subject_average] CHECK CONSTRAINT [FK_student_subject_average_semester]
GO
ALTER TABLE [dbo].[student_subject_average]  WITH CHECK ADD  CONSTRAINT [fkey_student_subject_average_student] FOREIGN KEY([id_student])
REFERENCES [dbo].[student] ([id_student])
GO
ALTER TABLE [dbo].[student_subject_average] CHECK CONSTRAINT [fkey_student_subject_average_student]
GO
ALTER TABLE [dbo].[student_subject_average]  WITH CHECK ADD  CONSTRAINT [fkey_student_subject_average_subject] FOREIGN KEY([id_subject])
REFERENCES [dbo].[subject] ([id_subject])
GO
ALTER TABLE [dbo].[student_subject_average] CHECK CONSTRAINT [fkey_student_subject_average_subject]
GO
ALTER TABLE [dbo].[subject_student_mark]  WITH CHECK ADD  CONSTRAINT [FK_subject_student_mark_semester] FOREIGN KEY([id_semester])
REFERENCES [dbo].[semester] ([id_semester])
GO
ALTER TABLE [dbo].[subject_student_mark] CHECK CONSTRAINT [FK_subject_student_mark_semester]
GO
ALTER TABLE [dbo].[subject_student_mark]  WITH CHECK ADD  CONSTRAINT [fkey_subject_student_mark_student] FOREIGN KEY([id_student])
REFERENCES [dbo].[student] ([id_student])
GO
ALTER TABLE [dbo].[subject_student_mark] CHECK CONSTRAINT [fkey_subject_student_mark_student]
GO
ALTER TABLE [dbo].[subject_student_mark]  WITH CHECK ADD  CONSTRAINT [fkey_subject_student_mark_subject] FOREIGN KEY([id_subject])
REFERENCES [dbo].[subject] ([id_subject])
GO
ALTER TABLE [dbo].[subject_student_mark] CHECK CONSTRAINT [fkey_subject_student_mark_subject]
GO
ALTER TABLE [dbo].[teacher_subject_class]  WITH CHECK ADD  CONSTRAINT [FK_teacher_subject_class_subject] FOREIGN KEY([id_subject])
REFERENCES [dbo].[subject] ([id_subject])
GO
ALTER TABLE [dbo].[teacher_subject_class] CHECK CONSTRAINT [FK_teacher_subject_class_subject]
GO
ALTER TABLE [dbo].[teacher_subject_class]  WITH CHECK ADD  CONSTRAINT [fkey_teacher_subject_class_class] FOREIGN KEY([id_class])
REFERENCES [dbo].[class] ([id_class])
GO
ALTER TABLE [dbo].[teacher_subject_class] CHECK CONSTRAINT [fkey_teacher_subject_class_class]
GO
ALTER TABLE [dbo].[teacher_subject_class]  WITH CHECK ADD  CONSTRAINT [fkey_teacher_subject_class_teacher] FOREIGN KEY([id_teacher])
REFERENCES [dbo].[teacher] ([id_teacher])
GO
ALTER TABLE [dbo].[teacher_subject_class] CHECK CONSTRAINT [fkey_teacher_subject_class_teacher]
GO
ALTER TABLE [dbo].[thesis]  WITH CHECK ADD  CONSTRAINT [fkey_thesis_class] FOREIGN KEY([id_class])
REFERENCES [dbo].[class] ([id_class])
GO
ALTER TABLE [dbo].[thesis] CHECK CONSTRAINT [fkey_thesis_class]
GO
ALTER TABLE [dbo].[thesis]  WITH CHECK ADD  CONSTRAINT [fkey_thesis_subject] FOREIGN KEY([id_subject])
REFERENCES [dbo].[subject] ([id_subject])
GO
ALTER TABLE [dbo].[thesis] CHECK CONSTRAINT [fkey_thesis_subject]
GO
/****** Object:  StoredProcedure [dbo].[AddAbsence]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddAbsence]
      @id_subject int,
      @id_student int,
	  @id_semester int,
	  @id_teacher int,
	  @date varchar(50),
	  @state varchar(50)
AS
BEGIN
  Insert into absence( id_subject ,
      id_student ,
	  id_semester ,
	  id_teacher ,
	  date ,
	  state )
  Values (  @id_subject ,
      @id_student ,
	  @id_semester ,
	  @id_teacher ,
	  @date ,
	  @state )

END
GO
/****** Object:  StoredProcedure [dbo].[AddClass]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddClass]
     @id_class int,
     @id_class_master int,
	 @specialization varchar(50),
	 @study_year int
AS
BEGIN
  Insert into class(id_class, id_class_master, specialization, study_year)
  Values ( @id_class, @id_class_master, @specialization, @study_year)

END
GO
/****** Object:  StoredProcedure [dbo].[AddClassMaster]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddClassMaster]
     @id_classmaster int,
     @id_teacher int
AS
BEGIN
  Insert into class_master(id_class_master, id_teacher)
  Values ( @id_classmaster, @id_teacher)

END
GO
/****** Object:  StoredProcedure [dbo].[AddClassSubject]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddClassSubject]
     @id_class int,
     @id_subject int
AS
BEGIN
  Insert into class_subject(id_class, id_subject)
  Values ( @id_class, @id_subject)

END

GO
/****** Object:  StoredProcedure [dbo].[AddMaterial]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddMaterial]
     @id_teacher int,
     @path varchar(150)
AS
BEGIN
  Insert into material(id_teacher, path)
  Values ( @id_teacher, @path)

END
GO
/****** Object:  StoredProcedure [dbo].[AddSMM]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddSMM]
	 @id_subject int,
	 @id_student int,
	 @id_semester int,
	 @date varchar(50),
     @mark int,
	 @is_thesis int
     
AS
BEGIN
  Insert into subject_student_mark(id_subject,id_student, id_semester, mark, date, is_thesis)
  Values ( @id_subject,@id_student, @id_semester, @mark, @date, @is_thesis)

END
GO
/****** Object:  StoredProcedure [dbo].[AddStudent]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddStudent]
      @id_student int,
      @student_name varchar(50),
	  @birth_date varchar(50)
	 
AS
BEGIN
  Insert into student(id_student, student_name, birth_date)
  Values ( @id_student, @student_name, @birth_date)

END
GO
/****** Object:  StoredProcedure [dbo].[AddStudentClass]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddStudentClass]
     @id_class int,
     @id_student int
AS
BEGIN
  Insert into student_class(id_student, id_class)
  Values (@id_student, @id_class)

END
GO
/****** Object:  StoredProcedure [dbo].[AddStudentSubjectAverage]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddStudentSubjectAverage]
     @id_student int,
	 @id_subject int,
	 @id_semester int,
	 @average int
AS
BEGIN
  Insert into student_subject_average(id_student, id_subject, id_semester, average)
  Values (@id_student, @id_subject, @id_semester, @average)

END
GO
/****** Object:  StoredProcedure [dbo].[AddSubject]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddSubject]
      @id_subject int,
      @subject_name varchar(50)
	 
AS
BEGIN
  Insert into subject(id_subject, name)
  Values ( @id_subject, @subject_name)

END
GO
/****** Object:  StoredProcedure [dbo].[AddTeacher]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddTeacher]
      @id_teacher int,
      @teacher_name varchar(50)  
AS
BEGIN
  Insert into teacher(id_teacher, teacher_name)
  Values ( @id_teacher, @teacher_name)

END
GO
/****** Object:  StoredProcedure [dbo].[AddTeacherSubjectClass]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddTeacherSubjectClass]
     @id_teacher int,
	 @id_subject int,
     @id_class int
     
AS
BEGIN
  Insert into teacher_subject_class(id_teacher, id_subject, id_class)
  Values ( @id_teacher, @id_subject, @id_class)

END
GO
/****** Object:  StoredProcedure [dbo].[AddThesis]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddThesis]
      @id_subject int,
      @id_class int
	 
AS
BEGIN
  Insert into thesis(id_subject, id_class)
  Values (@id_subject, @id_class)

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteAbsence]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteAbsence]
      @id_subject int,
      @id_student int,
	  @id_semester int,
	  @id_teacher int,
	  @date varchar(50),
	  @state varchar(50)
      
AS
BEGIN
  delete from absence where id_subject= @id_subject and
      id_student=@id_student and
	  id_semester=@id_semester and
	  id_teacher=@id_teacher and
	  date=@date and
	  state=@state 

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteClass]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteClass]
	@id_class int
	
AS
BEGIN
	delete from class
	where id_class= @id_class
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteClassMaster]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteClassMaster]
      @classMasterID int
      
AS
BEGIN
  delete from class_master where id_class_master = @classMasterID

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteClassSubject]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteClassSubject]
      @classID int
      
AS
BEGIN
  delete from class_subject where id_class = @classID

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteSSM]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteSSM] 
	 @id_subject int,
	 @id_student int,
	 @id_semester int,
	 @date varchar(50),
     @mark int
     
AS
BEGIN
 delete from subject_student_mark where
 id_subject=@id_subject and
 id_student=@id_student and
 id_semester=@id_semester and
 mark=@mark and
 date=@date

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteStudent]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteStudent]
	@studentID int
	
AS
BEGIN
	delete from student
	where id_student = @studentID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteStudentClass]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteStudentClass]
      @id_student int
      
AS
BEGIN
  delete from student_class where id_student = @id_student

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteSubject]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteSubject]
      @subjectID int
      
AS
BEGIN
  delete from subject where id_subject = @subjectID

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteTeacher]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteTeacher]
      @teacherID int
      
AS
BEGIN
  delete from teacher where id_teacher = @teacherID

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteTeacherSubjectClass]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteTeacherSubjectClass]
      @id_teacher int,
	  @id_subject int,
	  @id_class int
      
AS
BEGIN
  delete from teacher_subject_class where id_teacher=@id_teacher and id_subject=@id_subject and id_class=@id_class

END

GO
/****** Object:  StoredProcedure [dbo].[DeleteThesis]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteThesis]
     @id_class int, 
	 @id_subject int
      
AS
BEGIN
  delete from thesis where id_subject = @id_subject and id_class=@id_class;

END
GO
/****** Object:  StoredProcedure [dbo].[GetAbsences]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAbsences]
	@id_class_master int
AS
BEGIN
	select count (*) from absence inner join student_class on
	absence.id_student=student_class.id_student
	where student_class.id_class=(select class.id_class from class inner join
	class_master on class.id_class_master=class_master.id_class_master
	where class.id_class_master=@id_class_master);
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllAbsencesByClassMasterId]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllAbsencesByClassMasterId] 
	@id_class_master int
AS
BEGIN
select * from absence where id_student in 
(select id_student from student_class inner join class on
student_class.id_class=class.id_class where class.id_class_master=@id_class_master);

END
GO
/****** Object:  StoredProcedure [dbo].[GetAllAbsencesByStudentId]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllAbsencesByStudentId]
	@id_student int
AS
BEGIN
select * from absence where id_student in 
(select id_student from student_class inner join class on
student_class.id_class=class.id_class where student_class.id_student=@id_student);

END
GO
/****** Object:  StoredProcedure [dbo].[GetAllAbsencesByStudentId2]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllAbsencesByStudentId2]
	@id_student int
AS
BEGIN
select * from absence where id_student=@id_student;

END
GO
/****** Object:  StoredProcedure [dbo].[GetAllAbsencesByTeacherId]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllAbsencesByTeacherId]
	@id_teacher int
AS
BEGIN
	
	select * from absence where id_teacher=@id_teacher;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllClasses]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllClasses]
        
AS
BEGIN
 select * from class;

END
GO
/****** Object:  StoredProcedure [dbo].[GetAllClassesByTeacherId]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllClassesByTeacherId]
	@id_teacher int
AS
BEGIN
	select distinct class.id_class, class.id_class_master, class.specialization, class.study_year from class inner join teacher_subject_class on class.id_class=teacher_subject_class.id_class where id_teacher=@id_teacher
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllClassMasters]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllClassMasters]
        
AS
BEGIN
 select class_master.id_class_master, class_master.id_teacher, teacher.teacher_name from class_master inner join teacher
 on class_master.id_teacher = teacher.id_teacher;

END
GO
/****** Object:  StoredProcedure [dbo].[GetAllClassSubjects]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllClassSubjects]
        
AS
BEGIN
 select class_subject.id_class, class_subject.id_subject, subject.name from class_subject inner join subject 
 on class_subject.id_subject = subject.id_subject;

END
GO
/****** Object:  StoredProcedure [dbo].[GetAllCorigentStudent]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllCorigentStudent]
	
AS
BEGIN
	select distinct student.id_student, student.student_name, subject.name, student_subject_average.average from student
	inner join student_subject_average on student.id_student=student_subject_average.id_student inner join
	subject on student_subject_average.id_subject=subject.id_subject where student_subject_average.average<=5;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllExmatriculatiStudenti]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllExmatriculatiStudenti]
	
AS
BEGIN
	select student.student_name, count(*) from student
	inner join absence on student.id_student=absence.id_student group by student.student_name;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllMaterials]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllMaterials]
	@id_student int
AS
BEGIN

   select * from material where id_teacher in (select id_teacher from student_class where id_class in (
   select id_class from teacher_subject_class where id_student=@id_student));
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllMaterialsByTeacherId]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllMaterialsByTeacherId]
	@id_teacher int
AS
BEGIN
select * from material where id_teacher=@id_teacher;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllNemotivatedAbsencesByClassMasterId]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllNemotivatedAbsencesByClassMasterId] 
	@id_class_master int
AS
BEGIN
	select * from absence inner join student_class on
	absence.id_student=student_class.id_student
	where student_class.id_class=(select class.id_class from class inner join
	class_master on class.id_class_master=class_master.id_class_master
	where class.id_class_master=@id_class_master) and absence.state like 'ne%';
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllSSMByStudentId]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllSSMByStudentId] 
   @id_student int
AS
BEGIN

	SELECT * from subject_student_mark where id_student=@id_student;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllSSMByStudentIdAndSubjectId]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllSSMByStudentIdAndSubjectId] 
	@id_student int, 
	@id_subject int,
	@id_teacher int
AS
BEGIN
	select * from subject_student_mark where
	id_subject=@id_subject and id_student=@id_student;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllSSMByTeacherId]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllSSMByTeacherId]
	@id_teacher int
AS
BEGIN
select * from subject_student_mark where id_subject in
(select teacher_subject_class.id_subject from  teacher_subject_class
where teacher_subject_class.id_teacher=@id_teacher)
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllStudentClass]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllStudentClass]       
AS
BEGIN
 select student_class.id_class, student_class.id_student, student.student_name from student_class inner join student
 on student_class.id_student=student.id_student;

END
GO
/****** Object:  StoredProcedure [dbo].[GetAllStudents]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllStudents]
     
AS
BEGIN
 select * from student;

END
GO
/****** Object:  StoredProcedure [dbo].[GetAllStudentsByClassMasterId]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllStudentsByClassMasterId]
	@id_teacher int
AS
BEGIN
select distinct student.id_student, student.student_name, student.birth_date from student
inner join student_class on student.id_student=student_class.id_student
inner join class on student_class.id_class=class.id_class 
inner join class_master on class.id_class_master=class_master.id_class_master
where class_master.id_class_master=@id_teacher
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllStudentsByTeacherId]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllStudentsByTeacherId]
	@id_teacher int
AS
BEGIN
select distinct student.id_student, student.student_name, student.birth_date from student inner join student_class on student.id_student=student_class.id_student
inner join teacher_subject_class on student_class.id_class=teacher_subject_class.id_class where teacher_subject_class.id_teacher=@id_teacher
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllStudentSubjectAverage]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllStudentSubjectAverage]

AS
BEGIN
select * from student_subject_average;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllStudentSubjectAverageByClassMasterId]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllStudentSubjectAverageByClassMasterId]
     @id_class_master int
AS
BEGIN
     select * from student_subject_average where id_student in (
	 select student_class.id_student from student_class inner join class
	 on student_class.id_class=class.id_class where class.id_class_master=@id_class_master);
    
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllStudentSubjectAverageByStudentId]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllStudentSubjectAverageByStudentId]
     @id_student int
AS
BEGIN
     select distinct id_subject, id_student, id_semester, average from
	 student_subject_average where id_student=@id_student;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllStudentSubjectAverageByStudentId2]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllStudentSubjectAverageByStudentId2]
     @id_student int
AS
BEGIN
     select distinct student_subject_average.id_student, student_subject_average.id_subject, subject.name,
	 student_subject_average.id_semester, student_subject_average.average from
	 student_subject_average inner join subject on student_subject_average.id_subject =subject.id_subject
	 where student_subject_average.id_student=@id_student;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllStudentSubjects]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllStudentSubjects] 
	@id_teacher int
AS
BEGIN
	select student_class.id_student, teacher_subject_class.id_subject from student_class
	inner join teacher_subject_class on student_class.id_class=teacher_subject_class.id_class
	where teacher_subject_class.id_teacher=@id_teacher;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllSubjects]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllSubjects]
     
AS
BEGIN
 select * from subject;

END
GO
/****** Object:  StoredProcedure [dbo].[GetAllSubjectsByTeacherId]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllSubjectsByTeacherId]
	@id_teacher int
AS
BEGIN
	select distinct subject.id_subject, subject.name from subject inner join teacher_subject_class on subject.id_subject=teacher_subject_class.id_subject where id_teacher=@id_teacher
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllTeachers]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllTeachers]
     
AS
BEGIN
 select * from teacher;

END
GO
/****** Object:  StoredProcedure [dbo].[GetAllTeacherSubjectClass]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllTeacherSubjectClass]
        
AS
BEGIN
 select teacher.teacher_name,teacher_subject_class.id_teacher, teacher_subject_class.id_subject,
 subject.name, teacher_subject_class.id_class from teacher inner join teacher_subject_class
 on teacher.id_teacher=teacher_subject_class.id_teacher 
 inner join subject on teacher_subject_class.id_subject=subject.id_subject;

END
GO
/****** Object:  StoredProcedure [dbo].[GetAllThesis]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllThesis]
     
AS
BEGIN
 select thesis.id_class, thesis.id_subject, subject.name from thesis inner join subject on thesis.id_subject = subject.id_subject ;

END
GO
/****** Object:  StoredProcedure [dbo].[GetAverage]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAverage]
	@id_student int,
	@id_subject int
AS
BEGIN
	select AVG(mark) from subject_student_mark where
	id_subject=@id_subject and id_student=@id_student;
END
GO
/****** Object:  StoredProcedure [dbo].[GetFinalAverages]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetFinalAverages]
	
AS
BEGIN
	
	SELECT student_subject_average.id_student, student.student_name, avg(student_subject_average.average) from student_subject_average
	inner join student on student_subject_average.id_student=student.id_student group by student_subject_average.id_student, student.student_name;
END
GO
/****** Object:  StoredProcedure [dbo].[GetMarkAverage]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetMarkAverage]
@id_student int,
@id_subject int
AS
BEGIN
	
select AVG(mark) from subject_student_mark where
	id_subject=@id_subject and id_student=@id_student and is_thesis=1 ;
END
GO
/****** Object:  StoredProcedure [dbo].[GetMarkCount]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetMarkCount]
	@id_student int,
	@id_subject int
AS
BEGIN
	select count (mark) from subject_student_mark where
	id_subject=@id_subject and id_student=@id_student and is_thesis=1;
END
GO
/****** Object:  StoredProcedure [dbo].[GetMarkSum]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetMarkSum]
	@id_student int, 
	@id_subject int
AS
BEGIN
	select sum(mark) from subject_student_mark where 
	id_student=@id_student and id_subject=id_subject and
	is_thesis=1;
END
GO
/****** Object:  StoredProcedure [dbo].[GetNemotivatedAbsences]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetNemotivatedAbsences]
	@id_class_master int
AS
BEGIN
	select count (*) from absence inner join student_class on
	absence.id_student=student_class.id_student
	where student_class.id_class=(select class.id_class from class inner join
	class_master on class.id_class_master=class_master.id_class_master
	where class.id_class_master=@id_class_master) and absence.state like 'ne%';
END
GO
/****** Object:  StoredProcedure [dbo].[GetNumberOfAbsences]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetNumberOfAbsences]
	@id_class_master int
AS
BEGIN
	select count(*) from absence where
	id_student in (select student_class.id_student from student_class inner join 
	class on student_class.id_class=class.id_class where class.id_class_master=@id_class_master);
END
GO
/****** Object:  StoredProcedure [dbo].[GetThesisMark]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetThesisMark]
	@id_student int,
	@id_subject int
AS
BEGIN
	select mark from subject_student_mark where id_student=@id_student and id_subject=@id_subject
	and is_thesis=0;
END
GO
/****** Object:  StoredProcedure [dbo].[ModifyAbsence]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModifyAbsence]
	  @id_subject int,
      @id_student int,
	  @id_semester int,
	  @id_teacher int,
	  @date varchar(50),
	  @state varchar(50)
AS
BEGIN
	update	absence
	set		[date] = @date, [state]=@state
	where	 id_student=@id_student and
	  id_semester=@id_semester and
	  id_teacher=@id_teacher 
END
GO
/****** Object:  StoredProcedure [dbo].[ModifyClass]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModifyClass]
	@id_class int,
	@id_class_master int,
	@specialization varchar(50),
	@study_year int
AS
BEGIN
	update	class
	set		[id_class_master] = @id_class_master, 
			[specialization] = @specialization,
			[study_year] = @study_year
	where	id_class = @id_class
END
GO
/****** Object:  StoredProcedure [dbo].[ModifyClassMaster]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModifyClassMaster]
	@classMasterID int,
	@id_teacher int
	
AS
BEGIN
	update	class_master
	set		[id_teacher] = @id_teacher
	where	id_class_master = @classMasterID
END
GO
/****** Object:  StoredProcedure [dbo].[ModifyClassSubject]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModifyClassSubject]
	@classID int,
	@id_subject int
	
AS
BEGIN
	update	class_subject
	set		[id_subject] = @id_subject
	where	id_class = @classID
END
GO
/****** Object:  StoredProcedure [dbo].[ModifyStudent]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModifyStudent]
	@studentID int,
	@name varchar(50),
	@birthdate varchar(50)
	
AS
BEGIN
	update	student
	set		[student_name] = @name, 
			[birth_date] = @birthdate
	where	id_student = @studentID
END
GO
/****** Object:  StoredProcedure [dbo].[ModifyStudentClass]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModifyStudentClass]
	@id_class int,
	@id_student int
	
AS
BEGIN
	update	student_class
	set		[id_student] = @id_student
	where	id_class = @id_class
END
GO
/****** Object:  StoredProcedure [dbo].[ModifySubject]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModifySubject]
	@subjectID int,
	@name varchar(50)
	
AS
BEGIN
	update	subject
	set		[name] = @name
	where	id_subject = @subjectID
END
GO
/****** Object:  StoredProcedure [dbo].[ModifyTeacher]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModifyTeacher]
	@teacherID int,
	@name varchar(50)
	
AS
BEGIN
	update	teacher
	set		[teacher_name] = @name
	where	id_teacher = @teacherID
END
GO
/****** Object:  StoredProcedure [dbo].[ModifyTeacherSubjectClass]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModifyTeacherSubjectClass]
	@id_teacher int,
	@id_subject int,
	@id_class int
	
AS
BEGIN
	update	teacher_subject_class
	set		[id_subject] = @id_subject, [id_class]=@id_class
	where	id_teacher = @id_teacher
END
GO
/****** Object:  StoredProcedure [dbo].[ModifyThesis]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModifyThesis]
	@id_class int, 
	@id_subject int
	
AS
BEGIN
	update	thesis
	set		[id_subject] = @id_subject
	where	id_class = @id_class
END
GO
/****** Object:  StoredProcedure [dbo].[VerifyIfClassHasThesis]    Script Date: 28.05.2021 22:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VerifyIfClassHasThesis]
	@id_student int,
	@id_subject int
AS
BEGIN
	select thesis.id_class from thesis inner join student_class
	on thesis.id_class=student_class.id_class inner join class_subject on
	student_class.id_class=class_subject.id_class where student_class.id_student=@id_student and
	class_subject.id_subject=@id_subject;
END
GO
USE [master]
GO
ALTER DATABASE [EducationPlatform] SET  READ_WRITE 
GO
