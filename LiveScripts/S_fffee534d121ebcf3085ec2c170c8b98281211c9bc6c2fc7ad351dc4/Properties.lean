import LiveScripts.Shared
import LiveScripts.S_fffee534d121ebcf3085ec2c170c8b98281211c9bc6c2fc7ad351dc4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fffee534d121ebcf3085ec2c170c8b98281211c9bc6c2fc7ad351dc4.script [datum, redeemer, ctx] 10000]
