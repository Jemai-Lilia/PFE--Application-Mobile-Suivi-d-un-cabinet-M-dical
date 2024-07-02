<!DOCTYPE html>
<html>

<head>
    <title>{{ $subject }}</title>
</head>

<body>


    <div style="font-family: Arial, sans-serif; padding: 20px; background-color: #f5f5f5;">
        <div style="max-width: 600px; margin: 0 auto; background-color: white; border-radius: 10px; padding: 20px;">
            <h1 style="text-align: center; color: #3d3d3d; margin-bottom: 40px;">Bienvenue Chez SofiaCare !</h1>
            <p style="font-size: 18px ;color: #574cd4;">Code de réinilisation de mot de passe </p>
            <p style="font-size: 25px; color: #010101;text-align: center">{{ $code }}</p>
            <p style="font-size: 20px ;color: #3d3d3d;">Aprés avoir réinitialisé votre mot de passe,
                 vous souhaiterez peut-être mettre à jour les informations relatives à votre compte
                {{-- <strong>${role}</strong>.</p> --}}
            <p style="font-size: 18px; color: #3d3d3d;">Cet e-mail vous a éte envoyé parce qu'il vous avez oubliée votre mot de passe

            </p>
            {{-- <p style="font-size: 18px; color: #3d3d3d;">Here is your password: <strong>${password}</strong></p> --}}

            <p style="font-size: 16px; color: #666; margin-top: 40px;">Cordialement,<br>l'équipe de SofiaCare</p>
        </div>
    </div>
</body>

</html>
