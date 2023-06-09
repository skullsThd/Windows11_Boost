import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Arrays;

public class DataProtection {
    private JFrame frame;
    private JPanel panel;
    private JPasswordField passwordField;
    private JComboBox<String> actionComboBox;
    private JPanel mainPanel;

    public DataProtection() {
        frame = new JFrame("Data Protection");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setPreferredSize(new Dimension(800, 600));

        panel = new JPanel();
        panel.setLayout(new GridLayout(2, 1));

        passwordField = new JPasswordField();
        panel.add(passwordField);

        actionComboBox = new JComboBox<>();
        actionComboBox.addItem("Cifra");
        actionComboBox.addItem("Decifra");
        actionComboBox.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String selectedAction = (String) actionComboBox.getSelectedItem();
                if (selectedAction.equals("Cifra")) {
                    showEncryptionPanel();
                } else {
                    showDecryptionPanel();
                }
            }
        });
        panel.add(actionComboBox);

        mainPanel = new JPanel();
        mainPanel.setLayout(new CardLayout());

        frame.getContentPane().add(panel, BorderLayout.NORTH);
        frame.getContentPane().add(mainPanel, BorderLayout.CENTER);
        frame.pack();
        frame.setVisible(true);
    }

    private void showEncryptionPanel() {
        mainPanel.removeAll();

        JPanel encryptionPanel = new JPanel();
        encryptionPanel.setLayout(new BorderLayout());

        JPanel imageSelectionPanel = new JPanel();
        imageSelectionPanel.setLayout(new FlowLayout());

        JLabel imageLabel = new JLabel("Seleziona un'immagine:");
        imageSelectionPanel.add(imageLabel);

        JButton selectImageButton = new JButton("Sfoglia");
        selectImageButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                JFileChooser fileChooser = new JFileChooser();
                int userSelection = fileChooser.showOpenDialog(frame);

                if (userSelection == JFileChooser.APPROVE_OPTION) {
                    File selectedFile = fileChooser.getSelectedFile();
                    // TODO: Encrypt the selected image
                    JOptionPane.showMessageDialog(frame, "Immagine selezionata: " + selectedFile.getAbsolutePath());
                }
            }
        });
        imageSelectionPanel.add(selectImageButton);

        encryptionPanel.add(imageSelectionPanel, BorderLayout.NORTH);

        JTextArea plaintextArea = new JTextArea();
        encryptionPanel.add(plaintextArea, BorderLayout.CENTER);

        JButton encryptButton = new JButton("Cifra");
        encryptButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                char[] password = passwordField.getPassword();
                if (password.length > 0) {
                    String plaintext = plaintextArea.getText();
                    String encryptedText = encryptText(plaintext, password);
                    Arrays.fill(password, ' '); // Clear the password array

                    JFileChooser fileChooser = new JFileChooser();
                    fileChooser.setDialogTitle("Salva il file cifrato");
                    int userSelection = fileChooser.showSaveDialog(frame);

                    if (userSelection == JFileChooser.APPROVE_OPTION) {
                        String filePath = fileChooser.getSelectedFile().getAbsolutePath();
                        if (!filePath.endsWith(".encrypt")) {
                            filePath += ".encrypt";
                        }

                        try (FileOutputStream fileOutputStream = new FileOutputStream(filePath)) {
                            fileOutputStream.write(encryptedText.getBytes());
                            JOptionPane.showMessageDialog(frame, "File cifrato salvato correttamente.");
                        } catch (Exception ex) {
                            ex.printStackTrace();
                            JOptionPane.showMessageDialog(frame, "Errore durante il salvataggio del file.");
                        }
                    }
                } else {
                    JOptionPane.showMessageDialog(frame, "Inserire una password.");
                }
            }
        });
        encryptionPanel.add(encryptButton, BorderLayout.SOUTH);

        mainPanel.add(encryptionPanel, "Encryption");

        CardLayout cardLayout = (CardLayout) mainPanel.getLayout();
        cardLayout.show(mainPanel, "Encryption");
    }

    private void showDecryptionPanel() {
        // TODO: Implement decryption panel
    }

    private String encryptText(String plaintext, char[] password) {
        // TODO: Implement text encryption using the password

        // Just a placeholder implementation for demonstration
        return "Encrypted: " + plaintext;
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            public void run() {
                new DataProtection();
            }
        });
    }
}
