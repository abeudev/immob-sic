<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20211217234112 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE property DROP year_built, DROP type_property_id, CHANGE img_slide img_slide VARCHAR(255) NOT NULL, CHANGE in_slide in_slide TINYINT(1) NOT NULL, CHANGE statut_property_id statut_property_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE property ADD CONSTRAINT FK_8BF21CDE2D3B6045 FOREIGN KEY (statut_property_id) REFERENCES statut_property (id)');
        $this->addSql('CREATE INDEX IDX_8BF21CDE2D3B6045 ON property (statut_property_id)');
        $this->addSql('ALTER TABLE users ADD is_verified TINYINT(1) NOT NULL, CHANGE agence_id_id agence_id_id INT NOT NULL');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE property DROP FOREIGN KEY FK_8BF21CDE2D3B6045');
        $this->addSql('DROP INDEX IDX_8BF21CDE2D3B6045 ON property');
        $this->addSql('ALTER TABLE property ADD year_built DATE NOT NULL, ADD type_property_id INT DEFAULT NULL, CHANGE statut_property_id statut_property_id INT NOT NULL, CHANGE img_slide img_slide VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT NULL COLLATE `utf8mb4_unicode_ci`, CHANGE in_slide in_slide TINYINT(1) DEFAULT \'0\' NOT NULL');
        $this->addSql('ALTER TABLE users DROP is_verified, CHANGE agence_id_id agence_id_id INT DEFAULT NULL');
    }
}
