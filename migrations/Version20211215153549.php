<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20211215153549 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE statut_property (id INT AUTO_INCREMENT NOT NULL, libelle VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE property ADD description VARCHAR(255) NOT NULL, ADD in_slide TINYINT(1) NOT NULL, DROP year_built, CHANGE img_slide img_slide VARCHAR(255) NOT NULL, CHANGE type_property_id statut_property_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE property ADD CONSTRAINT FK_8BF21CDE2D3B6045 FOREIGN KEY (statut_property_id) REFERENCES statut_property (id)');
        $this->addSql('CREATE INDEX IDX_8BF21CDE2D3B6045 ON property (statut_property_id)');
        $this->addSql('ALTER TABLE users CHANGE agence_id_id agence_id_id INT NOT NULL');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE property DROP FOREIGN KEY FK_8BF21CDE2D3B6045');
        $this->addSql('DROP TABLE statut_property');
        $this->addSql('DROP INDEX IDX_8BF21CDE2D3B6045 ON property');
        $this->addSql('ALTER TABLE property ADD year_built DATE NOT NULL, DROP description, DROP in_slide, CHANGE img_slide img_slide VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT NULL COLLATE `utf8mb4_unicode_ci`, CHANGE statut_property_id type_property_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE users CHANGE agence_id_id agence_id_id INT DEFAULT NULL');
    }
}
