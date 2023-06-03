import sys
import os
from PyQt5.QtWidgets import QApplication, QMainWindow, QVBoxLayout, QWidget, QPushButton, QLabel

class PCBoostApp(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("PC Boost")
        self.setGeometry(100, 100, 501, 499)
        
        self.init_ui()
    
    def init_ui(self):
        layout = QVBoxLayout()
        
        # Etichetta per il titolo
        title_label = QLabel("PC Boost", self)
        title_label.setStyleSheet("font-size: 20px; font-weight: bold;")
        title_label.setAlignment(Qt.AlignCenter)
        layout.addWidget(title_label)
        
        # Pulsanti per le funzionalità di boost
        boost_batch_button = QPushButton("Esegui Boost (Batch)", self)
        boost_batch_button.clicked.connect(self.run_boost_batch)
        layout.addWidget(boost_batch_button)
        
        boost_ps1_button = QPushButton("Esegui Boost (PowerShell)", self)
        boost_ps1_button.clicked.connect(self.run_boost_ps1)
        layout.addWidget(boost_ps1_button)
        
        # Widget principale
        main_widget = QWidget()
        main_widget.setLayout(layout)
        self.setCentralWidget(main_widget)
    
    def run_boost_batch(self):
        # Esegue il file batch esterno per eseguire le operazioni di boost
        os.system("boost.bat")
    
    def run_boost_ps1(self):
        # Esegue lo script PowerShell esterno per eseguire le operazioni di boost
        os.system("powershell.exe -ExecutionPolicy Bypass -File boost.ps1")

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = PCBoostApp()
    window.show()
    sys.exit(app.exec())
