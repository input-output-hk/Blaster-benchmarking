import LiveScripts.Shared
import LiveScripts.S_cd5ef2bce08b24b300f5de711e81ca33574d6d51393442b68138707e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cd5ef2bce08b24b300f5de711e81ca33574d6d51393442b68138707e.script [ctx] 10000]
