using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace EducationPlatform.Views
{
    /// <summary>
    /// Interaction logic for ClassMasterWindow.xaml
    /// </summary>
    public partial class ClassMasterWindow : UserControl
    {
        public ClassMasterWindow()
        {
            InitializeComponent();
        }

        private void MotiveazaAbsente(object sender, RoutedEventArgs e)
        {
            AbsenceWindowForClassMaster absenceWindow = new AbsenceWindowForClassMaster();
            absenceWindow.Show();
        }

        private void TotalAbsente(object sender, RoutedEventArgs e)
        {
            TotalOfAbsencesWindow totalOfAbsencesWindow = new TotalOfAbsencesWindow();
            totalOfAbsencesWindow.Show();
        }

        private void TotalAbsenteNemotivate(object sender, RoutedEventArgs e)
        {
            TotalOfNemotivatedAbsencesWindow t = new TotalOfNemotivatedAbsencesWindow();
            t.Show();
        }
        private void AbsentePerElev(object sender, RoutedEventArgs e)
        {
            AbsencesStudent absStud = new AbsencesStudent();
            absStud.Show();

        }
        private void MediiPerElev(object sender, RoutedEventArgs e)
        {
            FinalAverageWindow fa = new FinalAverageWindow();
            fa.Show();

        }
    }
}
